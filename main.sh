#!/bin/bash
# ========================================================
# 리눅스 프로젝트 : 자동화된 개발 환경 세팅 도구
# 9조 - 김태경, 임준수
# ========================================================

while true; do
    # 추가 - 목록 출력 화면 디자인, 사용감 개선
    echo ""
    echo "================================================"
    echo "       개발 환경 세팅 도구 (Linux Project)       "
    echo "================================================"
    echo "1. 프로젝트 자동 초기화 (autoInit)"
    echo "2. .gitignore 자동 생성 (createGitignore)"
    echo "3. 코드 주석(TODO) 스캐너 (findTODO)"
    echo "4. Git 상태 대시보드 (gitDashboard)"
    echo "0. 종료"
    echo "================================================"
    
    read -p "메뉴를 선택하세요: " choice
    echo "" # 줄바꿈 추가

    case "$choice" in
        1)
            [ -f "./autoInit.sh" ] && ./autoInit.sh
            ;;
        2)
            [ -f "./createGitignore.sh" ] && ./createGitignore.sh
            ;;
        3)
            [ -f "./findTODO.sh" ] && ./findTODO.sh
            ;;
        4)
            [ -f "./gitDashboard.sh" ] && ./gitDashboard.sh
            ;;
        0)
            echo ">> 프로그램을 종료합니다."
            break
            ;;
        *)
            echo ">> 잘못된 입력입니다. 다시 선택해주세요."
            ;;
    esac

    #추가 - 기능 실행 후 잠시 대기 (UX 개선)
    echo ""
    read -p ">> 계속하려면 Enter를 누르세요..." dummy
done