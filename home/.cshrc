# set locale, to erase rdoc compiling error
setenv  LC_CTYPE        en_US.UTF-8
setenv  LANG            en_US.UTF-8


# color code
# 1 for brighter colors
# 4 for underlined text
# 5 for flashing text
# 30 for black foreground
# 31 for red foreground
# 32 for green foreground
# 33 for yellow (or brown) foreground
# 34 for blue foreground
# 35 for purple foreground
# 36 for cyan foreground
# 37 for white (or gray) foreground
# 40 for black background
# 41 for red background
# 42 for green background
# 43 for yellow (or brown) background
# 44 for blue background
# 45 for purple background
# 46 for cyan background
# 47 for white (or gray) background

# start red
set cr = "%{\e[31m%}" 
# start green
set cg = "%{\e[32m%}" 
# restore default color
set c0 = "%{\e[0m%}"  

# make prompt colorful
set prompt = "%n@%m:$cg%/$c0 %# "
