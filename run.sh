#/bin/bash

set -o errexit
set -o nounset
# set -o xtrace

Components=("ModAdder" "ModMultiplier" "SBox5" "MDSMatrixMultiplier" "PoseidonThread" "MDSMatrixAdders" "AXI4StreamReceiver" "AXI4StreamTransmitter" "DataLoopbackBuffer" "PoseidonTopLevel")

# print help info
function help()
{
    echo "Usage of this shell script: "
    echo "run.sh [-a] [-h] [-l] [-e component]"
    echo "-a: Build and test all components in this project."
    echo "-e: Specify a component in the project to be built and tested."
    echo "-h: Show the usage info of this shell script."
    echo "-l: Show all components in this project."
    echo "-c: check format "
    echo "-f: fix format "
}

#show all components
function show_all_components()
{
    echo "All components in this project: "
    for i in ${Components[*]}
    do 
        echo $i
    done
}


function build_and_test()
{
    component=$1
    testbench="${component}Test"
    object="${component}Verilog"

    # build
    if [[ $component != ${Components[0]} && $component != ${Components[1]} ]] 
    then
        echo -e "Building ${component} ... \n"

        #docker run --rm -v $(pwd):$(pwd) -w $(pwd) -u root datenlord/spinal-cocotb:1.6.1 sbt "runMain poseidon.${object}"
        #docker exec -w /spinalworkspace/poseidon-spinalhdl/ spinalhdl02 sbt "runMain poseidon.${object}"
        
        #docker exec -w /spinalworkspace/poseidon/ spinalhdl02 mill poseidon.runMain poseidon.${object}
        docker run --rm -v $(pwd):$(pwd) -w $(pwd) -u root datenlord/spinal-cocotb:1.6.1 mill poseidon.runMain poseidon.${object}
    fi

    echo -e "Compile And Build ${component} successfully !!!\n"
    echo "Testing ${component} ... "

    # copy rom files to testbench file 
    if [[ $component = ${Components[3]} || $component = ${Components[4]} || $component = ${Components[9]} ]]
    then
        mv ./src/main/verilog/${component}/*.bin ./src/tests/$testbench/
    fi

    docker run --rm -v $(pwd):$(pwd) -w $(pwd)/src/tests/$testbench -u root datenlord/spinal-cocotb:1.6.1 make

    rm -f ./src/tests/$testbench/*.bin
}


# Check parameters
while getopts "cfhlae:" opt
do
    case $opt in
        c)
        docker run --rm -v $(pwd):$(pwd) -w $(pwd) -u root datenlord/spinal-cocotb:1.6.1 sh -c "mill poseidon.checkFormat && mill poseidon.fix --check"
        black --check $(find ./src -name "*.py")
        # mill poseidon.checkFormat
        # mill poseidon.fix --check
        ;;
        
        f)
        black $(find ./src -name "*.py")
        docker run --rm -v $(pwd):$(pwd) -w $(pwd) -u root datenlord/spinal-cocotb:1.6.1 sh -c "mill mill.scalalib.scalafmt.ScalafmtModule/reformatAll __.sources && mill poseidon.fix"
        ;;

        h) help
        ;;

        l) show_all_components
        ;;

        e) build_and_test $OPTARG
        ;;
        
        a) 
        for i in ${Components[*]};do
            build_and_test $i
        done
        ;;
        ?)
        echo "wrong option"
        exit 1
        ;;
    esac

done
