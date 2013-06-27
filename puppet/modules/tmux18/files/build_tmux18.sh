#!/bin/bash

cd /root \
  && tar xzf tmux-1.8.tar.gz \
  && cd tmux-1.8 \
  && ./configure \
  && make \
  && sudo make install
