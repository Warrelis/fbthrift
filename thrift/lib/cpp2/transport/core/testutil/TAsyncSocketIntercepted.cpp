/*
 * Copyright 2018-present Facebook, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <thrift/lib/cpp2/transport/core/testutil/TAsyncSocketIntercepted.h>

namespace apache {
namespace thrift {
namespace async {

folly::AsyncSocket::WriteResult TAsyncSocketIntercepted::performWrite(
    const iovec* vec,
    uint32_t count,
    WriteFlags flags,
    uint32_t* countWritten,
    uint32_t* partialWritten) {
  std::vector<iovec> newiov;
  std::string corruptedDataHolder;
  if (params_.get() && params_->corruptLastWriteByte_) {
    newiov.resize(count);
    memcpy(newiov.data(), vec, sizeof(iovec) * count);
    int toModify = static_cast<int>(count) - 1;
    while (toModify >= 0 && vec[toModify].iov_len == 0) {
      --toModify;
    }
    if (toModify >= 0) {
      corruptedDataHolder.assign(
          static_cast<const char*>(newiov[toModify].iov_base),
          newiov[toModify].iov_len);
      ++corruptedDataHolder[corruptedDataHolder.size() - 1];
      newiov[toModify].iov_base = const_cast<void*>(
          static_cast<const void*>(corruptedDataHolder.data()));
    }
    vec = newiov.data();
  }
  return TAsyncSocket::performWrite(
      vec, count, flags, countWritten, partialWritten);
}

folly::AsyncSocket::ReadResult TAsyncSocketIntercepted::performRead(
    void** buf,
    size_t* buflen,
    size_t* offset) {
  ReadResult res = TAsyncSocket::performRead(buf, buflen, offset);

  if (params_.get() && params_->corruptLastReadByte_ && !res.exception &&
      res.readReturn > 0 &&
      res.readReturn >= params_->corruptLastReadByteMinSize_) {
    static_cast<char*>(*buf)[res.readReturn - 1]++;
  }
  return res;
}

} // namespace async
} // namespace thrift
} // namespace apache
