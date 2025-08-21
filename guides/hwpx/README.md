# HWPX 도구 가이드

MyMCP의 HWPX 도구를 사용하여 마크다운 파일을 한글 문서(HWPX) 형식으로 변환하는 방법을 안내합니다.

## 🎯 개요

HWPX 도구는 마크다운 문서를 한글과컴퓨터의 HWPX 형식으로 변환하여 한글 문서로 편집할 수 있게 해줍니다.

## 🚀 주요 기능

### **마크다운 → HWPX 변환**
- 마크다운 파일을 HWPX 형식으로 자동 변환
- 제목, 단락, 목록 등 마크다운 요소 지원
- 한글 폰트 및 스타일 자동 적용

### **지원하는 마크다운 요소**
- **제목**: `#`, `##`, `###` 등 (h1~h6)
- **단락**: 일반 텍스트
- **목록**: 순서 있는 목록, 순서 없는 목록
- **강조**: 굵게, 기울임꼴

### **HWPX 파일 구조**
- 표준 HWPX 파일 형식 준수
- 한글 문서와 완벽 호환
- 메타데이터 및 스타일 정보 포함

## 📖 사용법

### **Claude Desktop에서 사용**
1. MCP 서버 연결 확인
2. HWPX 도구 활성화
3. 자연어로 변환 요청

**사용 예시:**
```
"sample.md 파일을 HWPX 형식으로 변환해줘"
"마크다운 문서를 한글 문서로 변환해줘"
```

### **Cursor에서 사용**
1. MCP 확장 프로그램 설치
2. HWPX 도구 연결
3. 명령 팔레트를 통한 사용

## 🔧 설정

### **환경변수**
```bash
export HWPX_TOOLS_ENABLED="true"
export HWPX_MAX_FILE_SIZE="50MB"
export HWPX_ALLOWED_EXTENSIONS=".md,.markdown"
```

### **필요한 Python 패키지**
```bash
pip install markdown beautifulsoup4
```

## 📁 파일 구조

### **입력 파일**
- **마크다운 파일**: `.md`, `.markdown` 확장자
- **인코딩**: UTF-8 권장
- **내용**: 제목, 단락, 목록 등

### **출력 파일**
- **HWPX 파일**: `.hwpx` 확장자
- **한글 문서**: 한글 2010 이상에서 열기 가능
- **호환성**: Windows, macOS, Linux

## 🛠️ 기술적 세부사항

### **변환 과정**
1. 마크다운 파일 읽기 (UTF-8)
2. 마크다운을 HTML로 변환
3. HTML 파싱 및 요소 분석
4. HWPX XML 구조 생성
5. ZIP 압축으로 HWPX 파일 생성

### **HWPX 파일 구성**
```
HWPX 파일
├── mimetype                    # 파일 타입 정의
├── META-INF/                  # 메타데이터
│   ├── container.xml         # 컨테이너 정보
│   ├── container.rdf         # RDF 메타데이터
│   └── manifest.xml          # 매니페스트
├── Contents/                  # 문서 내용
│   ├── content.hpf           # 패키지 정보
│   ├── header.xml            # 문서 헤더
│   └── section0.xml          # 문서 본문
└── Preview/                   # 미리보기
    └── PrvText.txt           # 미리보기 텍스트
```

## 📚 사용 예시

### **기본 변환**
```python
from tools.hwpx_tools import markdown_to_hwpx

# 마크다운을 HWPX로 변환
markdown_to_hwpx("document.md", "output.hwpx")
```

### **Claude Desktop에서 사용**
```
사용자: "README.md 파일을 한글 문서로 변환해줘"

Claude: README.md 파일을 HWPX 형식으로 변환하여 한글 문서로 사용할 수 있도록 하겠습니다.
변환이 완료되었습니다. output.hwpx 파일이 생성되었습니다.
```

## ⚠️ 주의사항

### **파일 크기 제한**
- 마크다운 파일: 최대 50MB
- HWPX 파일: 변환 후 크기 증가 가능

### **지원되지 않는 요소**
- 이미지 (현재 버전)
- 표 (현재 버전)
- 코드 블록 (현재 버전)
- 링크 (현재 버전)

### **폰트 및 스타일**
- 기본 한글 폰트 사용
- 사용자 정의 폰트는 지원하지 않음
- 스타일은 기본값으로 설정

## 🔍 문제 해결

### **변환 실패**
1. 마크다운 파일 인코딩 확인 (UTF-8)
2. 파일 경로 및 권한 확인
3. Python 패키지 설치 확인

### **HWPX 파일 열기 안됨**
1. 한글 버전 확인 (2010 이상)
2. 파일 확장자 확인 (.hwpx)
3. 파일 손상 여부 확인

### **스타일 문제**
1. 기본 폰트 설치 확인
2. 한글 언어 팩 설치 확인
3. 문서 호환성 모드 확인

## 📖 추가 정보

- **전체 프로젝트 가이드**: [README.md](../../README.md)
- **사용 예시**: [examples/hwpx/README.md](../../examples/hwpx/README.md)
- **MCP 클라이언트 설정**: [MCP-CLIENT.md](../setup/MCP-CLIENT.md)
- **MCP 서버 구축**: [MCP-SERVER.md](../setup/MCP-SERVER.md)

## 🤝 도움 요청

HWPX 도구 사용 중 문제가 발생하면:
1. [GitHub Issues](https://github.com/chulgil/mymcp/issues)에서 도움 요청
2. 오류 메시지와 함께 문제 상황 설명
3. 입력 마크다운 파일 내용 공유
4. 운영체제와 한글 버전 정보 포함
