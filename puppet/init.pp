include system
include nodejs
include compass-susy

Class["system"] -> Class["nodejs"]
Class["nodejs"] -> Class["compass-susy"]
