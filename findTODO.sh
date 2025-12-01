#!/bin/bash

# ========================================================
# 기능 3: 코드 주석(TODO) 스캐너
# 작성자: 김태경
# ========================================================

echo ">> 코드 주석 스캐너(TODO)를 실행합니다."

# 1. 검색할 대상 디렉토리 입력
read -p "검색할 프로젝트 디렉토리 경로를 입력하세요 (현재폴더는 . 입력)" target_dir

if [ ! -d "$target_dir" ]; then
    echo "오류: '$target_dir' 디렉토리를 찾을 수 없습니다."
    exit 1
fi

echo ">> '$target_dir' 내의 소스 파일에서 'TODO' 주석을 검색합니다..."
echo "----------------[ 검색 결과 ]----------------"

# 키워드(TODO) 검색 및 파일명, 줄 번호 출력
search_keyword="TODO|ToFix"
result=$(grep -r -n -I -i -E "$search_keyword" "$target_dir")

if [ -z "$result" ]; then
    echo "키워드를 찾을 수 없습니다"
    exit 1
fi

count=$(echo "$result" | wc -l)
count=$(echo $count)

echo ">> 총 ${count}개의 TODO를 발견했습니다."
echo "$result"