#!/bin/bash
#
# Test the JMeter Docker image using a trivial test plan.

# Example for using User Defined Variables with JMeter
# These will be substituted in JMX test script
# See also: http://stackoverflow.com/questions/14317715/jmeter-changing-user-defined-variables-from-command-line
export TARGET_HOST="lifecharger.org"
export TARGET_PATH="/archives/"
export TARGET_PATH1="/2-minute-rule/"

T_DIR=tests
R_DIR=T_DIR

./run.sh  -JTARGET_HOST=${TARGET_HOST} \ -JTARGET_PATH=${TARGET_PATH} \ -JTARGET_PATH=${TARGET_HOST}${TARGET_PATH1} \ -n -t ${T_DIR}/lifecharger_testplan.jmx -l ${T_DIR}/test-plan.jtl \ -e -o ${R_DIR}

echo "==== Raw Test Report ===="
cat ${T_DIR}/test-plan.jtl

echo "==== HTML Test Report ===="
echo "See HTML test report in ${R_DIR}/index.html"