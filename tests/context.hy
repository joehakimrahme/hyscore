;; This file allows test_hyscore.hy to import hyscore without installing it
;; on the user's system
(import os)
(import sys)
(.insert sys.path 0 (.abspath os.path ".."))

(import hyscore)
