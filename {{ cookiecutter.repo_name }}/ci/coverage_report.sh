#!/usr/bin/env bash
source ci/config.sh
source ci/dingding.sh

COVERAGE_REPORT_FILE="coverage-reports/coverage.xml"

if [[ ! -e $COVERAGE_REPORT_FILE ]];then
  echo "Coverage file does not exit, plz run test first."
  exit 1
fi

new_coverage_ratio=$(pipenv run diff-cover $COVERAGE_REPORT_FILE | grep -E 'Coverage:' | sed -e 's/[^0-9]//g')
echo "$new_coverage_ratio"

total_coverage_ratio=$(grep -oE 'line-rate="(1|0\.[0-9]+)"' $COVERAGE_REPORT_FILE | head -1 | grep -oP '[0-9]+(?=")')
echo "$total_coverage_ratio"

if [[ (-z "$new_coverage_ratio" || $new_coverage_ratio -gt $new_coverage_threshold)  && ($total_coverage_ratio -eq 1 || $total_coverage_ratio -ge $total_coverage_threshold) ]]
then
  echo "测试覆盖率很好，请继续保持 ~"
  exit 0
fi

echo "测试覆盖率不合格，请重新提交 ~"
# notify gitlab_user
MESSAGE=""
if [[ -z $new_coverage_ratio ]]
then
  MESSAGE+="$MESSAGE 没有新增测试。总体测试覆盖率为$total_coverage_ratio%。\n数值偏低, 请注意"
else
  MESSAGE+="$MESSAGE  新增测试覆盖率为$new_coverage_ratio%。总体测试覆盖率为$total_coverage_ratio%。\n数值偏低, 请注意"
fi

echo "$MESSAGE"
ding_notify "$GITLAB_USER_EMAIL" "测试覆盖率不合格" "$MESSAGE"

exit 1
