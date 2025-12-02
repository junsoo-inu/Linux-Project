#!/bin/bash

# ========================================================
# 기능 2: .gitignore 자동 생성
# 작성자: 임준수
# ========================================================

echo ">> .gitignore 자동 생성기를 실행합니다."

# 1. 적용할 디렉토리 입력
read -p "적용할 프로젝트 디렉토리 경로를 입력하세요 (현재폴더는 . 입력): " target_dir

if [ ! -d "$target_dir" ]; then
    echo "오류: '$target_dir' 디렉토리를 찾을 수 없습니다."
    exit 1
fi

# 2. 언어 선택
read -p "언어 타입을 입력하세요 (python/c): " lang_type

gitignore_path="${target_dir}/.gitignore"

# 3. 언어별 제외 파일 설정
case "$lang_type" in
    python|PYTHON|py|파이썬)
        echo "__pycache__/" > "$gitignore_path"
        echo "*.pyc" >> "$gitignore_path"
        echo ".venv/" >> "$gitignore_path"
        echo ".env" >> "$gitignore_path"
        echo ">> Python용 .gitignore 파일이 생성되었습니다."
        ;;
    c|C|씨)
        echo "*.o" > "$gitignore_path"
        echo "*.out" >> "$gitignore_path"
        echo "*.exe" >> "$gitignore_path"
        echo ".vscode/" >> "$gitignore_path"
        echo ">> C언어용 .gitignore 파일이 생성되었습니다."
        ;;
    *)
        echo ">> 지원하지 않는 언어입니다. 빈 .gitignore 파일을 생성합니다."
        touch "$gitignore_path"
        ;;
esac

echo ">> 생성 위치: $gitignore_path"