#!/bin/sh

set -x

if [ -s /tmp/images.txt ]; then
  tail /tmp/images.txt | awk '{ 
  if(NF==2){
    dst = $2;
  }else{
    dst = $1;
    gsub(/^[^\/]+\//, "", dst);
    gsub("/", "_", dst);
  }
  print "skopeo copy --multi-arch all docker://"$1" docker://crpi-v2l1ieaudbcci8vw.cn-beijing.personal.cr.aliyuncs.com/tyq07/"dst;
}' | xargs -I {} sh -c "{}"
fi
