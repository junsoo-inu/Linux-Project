#!/bin/bash
# ========================================================
# 리눅스 프로젝트 : 자동화된 개발 환경 세팅 도구
# 9조 - 김태경, 임준수
# ========================================================

while true; do
    echo "1. 프로젝트 자동 초기화 (autoInit)"
    echo "2. .gitignore 자동 생성 (createGitignore)"
    echo "3. 코드 주석(TODO) 스캐너 (findTODO)"
    echo "4. Git 상태 대시보드 (gitDashboard)"
    echo "0. 종료"
    read -p "메뉴를 선택하세요: " choice
    case "$choice" in
        1) [ -f "./autoInit.sh" ] && ./autoInit.sh ;;
        2) [ -f "./createGitignore.sh" ] && ./createGitignore.sh ;;
        3) [ -f "./findTODO.sh" ] && ./findTODO.sh ;;
        4) [ -f "./gitDashboard.sh" ] && ./gitDashboard.sh ;;
        0) break ;;
        *) echo "다시 선택해주세요." ;;
    esac
done