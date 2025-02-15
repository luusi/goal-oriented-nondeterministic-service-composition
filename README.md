# LTLf Goal-oriented Service Composition

This is the supplementary material for the paper "LTLf Goal-oriented Service Composition".

Link repo: [https://github.com/marcofavorito/icaps-2024-ltlf-goal-oriented-service-composition](https://github.com/marcofavorito/icaps-2024-ltlf-goal-oriented-service-composition)

Link GH page: [https://marcofavorito.github.io/icaps-2024-ltlf-goal-oriented-service-composition](https://marcofavorito.github.io/icaps-2024-ltlf-goal-oriented-service-composition)


In the GitHub version, you won't find code in `prologex` since it must be asked to the authors of the TB's paper to make it public, ask the software to the authors:

    Torres, Jorge, and Jorge A. Baier. "Polynomial-time reformulations of LTL temporally extended goals into final-state goals." Twenty-Fourth International Joint Conference on Artificial Intelligence. 2015.


## Preliminaries

We tested the instructions on Ubuntu 22.04 platform.

### Main code dependencies

- Make sure you have Python 3.11 installed
- Install Pipenv: https://pipenv.pypa.io/en/latest/
- Clone the repository:
```
git clone --recursive https://github.com/marcofavorito/ltlf-goal-oriented-service-composition.git
cd ltlf-goal-oriented-service-composition
```

- Use Pipenv to set up the virtual environment:
```
pipenv shell --python=3.11
pipenv install --dev
```

- In each new terminal, run the following
```
export PYTHONPATH=${PYTHONPATH:+$PYTHONPATH:}$(pwd)
```

### T&B code dependencies

Torres & Baier's software (T&B or TB in short), stored in `prologex`, has been kindly given by the authors.

To use it, you need to install SWI-Prolog.

- Download and install SWI-Prolog: https://www.swi-prolog.org/download/stable. 
  On Ubuntu you can run:
```
sudo apt install swi-prolog
```

Then:
```
cd prologex
sudo chmod u+x convert.sh
sudo chmod u+x pddl2effax.sh
```


### Fast Downward

A copy of the Fast Downward repository is cloned in `planners/downward`.

[Here](https://github.com/aibasel/downward/blob/main/BUILD.md) you can find the build instructions.

Linux/MacOS: you need a C++ compiler, CMake and GNU make. To run the planner, you also need Python 3.

On Debian/Ubuntu, the following should install all these dependencies:

```
sudo apt install cmake g++ make python3
```

Windows: install Visual Studio >= 2017, Python, and CMake. During the installation of Visual Studio, the C++ compiler is not installed by default, but the IDE prompts you to install it when you create a new C++ project.


Then:
```
cd planners/downward
./build.py
```


### MyND Planner

A copy of the MyND repository is cloned in `planners/MyND`.

To use the MyND planner, you have to install Java >=8, <15.

You can use [SdkMan](https://sdkman.io/):
```
sdk install java 14.0.2-open
sdk install maven 3.9.6
```

Then, build MyND:
```
cd planners/mynd/
./build.sh
```

Apply the Git patch to fix a minor compatibility issue with newer versions of Python:
```
git apply ../../mynd.patch
cd ../../
```

To install `ltlfond2fond`:

```
sudo apt install -y flex bison

cd ltlfond2fond
git submodule update --init

# apply a patch
git apply ../ltlfond2fond.patch

# install the ltlfkit subproject
cd ext/ltlfkit

# first install ltlf2fol
cd LTLf2FOL/ltlf2fol
make
make run
cd ../../

# then install MONA:
git submodule update --init --recursive
cd ext/MONA/
autoreconf -f -i
./configure --prefix=`pwd`
make
sudo make install-strip
cd ../../../../
```

Install SPOT:

```
wget http://www.lrde.epita.fr/dload/spot/spot-2.12.2.tar.gz
tar -xzf spot-2.12.2.tar.gz
cd spot-2.12.2
./configure --prefix /usr/local --with-pythondir="$(echo $(which python) | rev | cut -d/ -f3- | rev)/lib/python3.11/site-packages"
make
sudo make install
```

## Run experiments

```
./experiments/run-all.sh output-final 300.0
```

## Print table and plots

```
./experiments-generate-plots.sh output-final output-final-plots
```

