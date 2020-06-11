#!/bin/bash
#
# Test the JMeter Docker image using a trivial test plan.

# Example for using User Defined Variables with JMeter
# These will be substituted in JMX test script
# See also: http://stackoverflow.com/questions/14317715/jmeter-changing-user-defined-variables-from-command-line
export TARGET_HOST="guru99.com"
export TARGET_PATH="/software-testing.html"


T_DIR=tests
R_DIR=tests/reports

./run.sh  -JTARGET_HOST=${TARGET_HOST} \ -JTARGET_PATH=${TARGET_PATH} \ -n -t ${T_DIR}/Test-Plan.jmx -l ${T_DIR}/test-plan.jtl \ -e -o $1

echo "==== Raw Test Report ===="
cat ${T_DIR}/test-plan.jtl

echo "==== HTML Test Report ===="
echo "See HTML test report in ${R_DIR}/index.html"