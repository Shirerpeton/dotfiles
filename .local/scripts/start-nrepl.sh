#!/usr/bin/bash

clojure -Sdeps '{:deps {nrepl {:mvn/version "0.7.0"} cider/cider-nrepl {:mvn/version "0.25.2"}}}' -m nrepl.cmdline --middleware '["cider.nrepl/cider-middleware"]'
