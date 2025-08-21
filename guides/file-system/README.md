# 파일 시스템 도구 가이드

MyMCP의 파일 시스템 도구를 사용하여 로컬 컴퓨터의 파일과 디렉토리를 관리하는 방법을 안내합니다.

## 🎯 개요

파일 시스템 도구는 AI를 통해 로컬 컴퓨터의 파일과 디렉토리를 안전하고 효율적으로 관리할 수 있게 해줍니다.

## 🚀 주요 기능

### **파일 관리**
- 파일 읽기/쓰기
- 파일 복사/이동/삭제
- 파일 권한 관리
- 파일 메타데이터 조회

### **디렉토리 관리**
- 디렉토리 생성/삭제
- 디렉토리 구조 분석
- 파일 정리 및 분류
- 중복 파일 감지

### **검색 및 필터링**
- 파일명 기반 검색
- 확장자별 필터링
- 크기별 정렬
- 날짜별 정렬

## 📖 사용법

### **Claude Desktop에서 사용**
1. MCP 서버 연결 확인
2. 파일 시스템 도구 활성화
3. 자연어로 명령어 입력

### **Cursor에서 사용**
1. MCP 확장 프로그램 설치
2. 파일 시스템 도구 연결
3. 명령 팔레트를 통한 사용

## 🔧 설정

### **환경변수**
```bash
export FILE_SYSTEM_ENABLED="true"
export FILE_MAX_SIZE="100MB"
export FILE_ALLOWED_EXTENSIONS=".txt,.csv,.xlsx,.xls,.json,.py,.md"
```

### **보안 설정**
- 허용된 경로 설정
- 차단된 확장자 설정
- 파일 크기 제한

## 📚 추가 정보

- **전체 프로젝트 가이드**: [README.md](../../README.md)
- **사용 예시**: [examples/file-system/README.md](../../examples/file-system/README.md)
- **MCP 클라이언트 설정**: [MCP-CLIENT.md](../setup/MCP-CLIENT.md)
