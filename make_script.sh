SCRIPT_DIR=$(builtin cd "`dirname "${BASH_SOURCE[0]}"`" > /dev/null && pwd)
cd $SCRIPT_DIR

# add some commit safety
cp .git/hooks/pre-commit.sample .git/hooks/pre-commit
cp .git/hooks/pre-commit.sample ../opencv_contrib/.git/hooks/pre-commit

# make and build according to
#   https://github.com/Itseez/opencv/wiki/How_to_contribute
mkdir -p $SCRIPT_DIR/build
cd $SCRIPT_DIR/build
cmake -DOPENCV_EXTRA_MODULES_PATH=$SCRIPT_DIR/../opencv_contrib/modules $SCRIPT_DIR
make
#make -j5
