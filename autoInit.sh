#!/bin/bash

# ========================================================
# 기능 1: 프로젝트 자동 초기화
# 작성자: 김태경
# ========================================================

echo ">> 프로젝트 자동 초기화를 시작합니다."

# 프로젝트 이름과 사용 언어 입력
read -p "생성할 프로젝트 이름(폴더명)을 입력하세요: " project_name
read -p "사용할 언어를 입력하세요 (python/c): " lang_type

# 폴더 생성 후 진입
if [ -d "$project_name" ]; then
    echo "오류: '$project_name' 폴더가 이미 존재합니다."
    exit 1
fi
mkdir -p "$project_name"
cd "$project_name" || exit

echo ">> '$project_name' 디렉토리가 생성되었습니다."

# git init으로 초기화
git init
echo ">> Git 저장소가 초기화되었습니다."

# 소스코드 파일 생성 및 작성자 설정
# 환경변수 USER를 작성자로 활용
# 디폴트 작성자 = Unknown
author=${USER:-"Unknown"} 

case "$lang_type" in
    python|PYTHON|py|파이썬)
        filename="Main.py"
        #echo "# Main.py" > "$filename" 
        echo "# 작성자: $author" > "$filename"
        echo "# TODO: 여기에 코드를 작성하세요" >> "$filename"
        ;;
    c|C|씨)
        filename="main.c"
        echo "// main.c 작성자: $author" > "$filename"
        echo "// TODO: Implement main function" >> "$filename"
        ;;
    *)
        filename="main.txt"
        echo "지원하지 않는 언어입니다. 기본 텍스트 파일을 생성합니다."
        ;;
esac

echo ">> 기본 소스 파일 '$filename'이(가) 생성되었습니다."
echo ">> 프로젝트 초기화 완료."