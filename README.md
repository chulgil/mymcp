# MyMCP - 로컬 MCP 도구 사용 가이드

로컬 컴퓨터에서 Excel, 파일 시스템 등을 Claude AI나 Cursor를 통해 MCP(Model Context Protocol)로 연결하여 사용하는 방법을 안내하는 프로젝트입니다.

## 🎯 프로젝트 목적

이 프로젝트는 다음과 같은 목적으로 제작되었습니다:

- **로컬 MCP 도구 설정**: 개인 컴퓨터에서 MCP 서버를 구축하고 실행
- **AI 도구 연동**: Claude Desktop, Cursor 등에서 MCP 도구 사용
- **실용적인 가이드**: Excel, 파일 시스템, HWPX 등 실제 작업에 필요한 도구 사용법
- **단계별 설정**: 초보자도 쉽게 따라할 수 있는 상세한 설치 가이드

## 📁 프로젝트 구조

```
mymcp/
├── README.md                 # 메인 프로젝트 소개
├── requirements.txt          # Python 의존성
├── config/                   # 설정 파일들
│   ├── README.md            # 설정 파일 가이드
│   ├── claude-mcp-config.json # Claude Desktop MCP 설정
│   ├── claude-mcp-config-simple.json # 간단한 MCP 설정
│   └── excel-tools-config.json # Excel 도구 설정
├── guides/                   # 상세 가이드 문서
│   ├── setup/               # MCP 설정 가이드
│   │   ├── MCP-CLIENT.md    # 클라이언트 설치 및 설정
│   │   └── MCP-SERVER.md    # 서버 구축 가이드
│   ├── claude-desktop/      # Claude Desktop 사용법
│   ├── cursor/              # Cursor 사용법
│   ├── excel/               # Excel 도구 사용법
│   ├── file-system/         # 파일 시스템 도구 사용법
│   ├── search/              # 검색 도구 사용법
│   └── hwpx/                # HWPX 도구 사용법
├── examples/                 # 실제 사용 예시
│   ├── README.md            # 전체 사용 예시 가이드
│   ├── excel/               # Excel 작업 예시
│   ├── file-system/         # 파일 시스템 작업 예시
│   └── hwpx/                # HWPX 도구 사용 예시
├── scripts/                  # 실행 스크립트
│   ├── README.md            # 스크립트 사용법
│   └── environment-setup.sh # 환경변수 설정 스크립트
└── tools/                    # MCP 도구 구현
    ├── desktop.py           # 통합 MCP 서버
    └── hwpx_tools.py        # HWPX 변환 도구
```

## 🚀 빠른 시작

### 1. 프로젝트 클론 및 설치

```bash
# 프로젝트 클론
git clone https://github.com/chulgil/mymcp.git
cd mymcp

# Python 의존성 설치
pip install -r requirements.txt
```

### 2. MCP 서버 실행

```bash
# MCP 서버 시작
python tools/desktop.py
```

### 3. 클라이언트 연결

- **Claude Desktop**: [설정 가이드](guides/setup/MCP-CLIENT.md) 참조
- **Cursor**: [Cursor 가이드](guides/cursor/README.md) 참조

## 📚 전체 문서 목차

### 📖 가이드 문서 (guides/)
#### MCP 설정 가이드
- **[MCP-CLIENT.md](guides/setup/MCP-CLIENT.md)** - MCP 클라이언트 설치 및 설정 가이드
- **[MCP-SERVER.md](guides/setup/MCP-SERVER.md)** - MCP 서버 구축 및 실행 가이드

#### 클라이언트별 사용법
- **[Claude Desktop 가이드](guides/claude-desktop/README.md)** - Claude Desktop에서 MCP 도구 사용법
- **[Cursor 가이드](guides/cursor/README.md)** - Cursor 에디터에서 MCP 도구 사용법

#### 도구별 사용법
- **[Excel 도구 가이드](guides/excel/README.md)** - Excel 파일 조작, 차트 생성, 피벗 테이블 등
- **[파일 시스템 도구 가이드](guides/file-system/README.md)** - 파일 및 디렉토리 관리
- **[검색 도구 가이드](guides/search/README.md)** - 웹 검색, 문서 검색 등
- **[HWPX 도구 가이드](guides/hwpx/README.md)** - 마크다운을 한글 문서로 변환

### 📝 사용 예시 문서 (examples/)
- **[사용 예시 가이드](examples/README.md)** - Excel, 파일 시스템, HWPX 도구 사용 예시

### ⚙️ 설정 파일 (config/)
- **[설정 파일 가이드](config/README.md)** - Claude Desktop MCP 설정 및 Excel 도구 설정
- **[Claude MCP 설정](config/claude-mcp-config.json)** - MyMCP 데스크톱 통합 서버 설정
- **[Excel 도구 설정](config/excel-tools-config.json)** - Excel 도구 매개변수 및 설정 정의

### 🚀 실행 스크립트 (scripts/)
- **[스크립트 가이드](scripts/README.md)** - 환경변수 설정 및 실행 스크립트
- **[환경변수 설정 스크립트](scripts/environment-setup.sh)** - MyMCP 환경변수 자동 설정

### 🛠️ 도구 구현 (tools/)
- **[desktop.py](tools/desktop.py)** - 데스크톱 MCP 도구 메인 서버 (Excel, 파일시스템, 검색, HWPX 도구 통합)
- **[hwpx_tools.py](tools/hwpx_tools.py)** - 마크다운을 한글 문서(HWPX)로 변환하는 도구

### 📋 프로젝트 설정 파일
- **[requirements.txt](requirements.txt)** - Python 의존성 패키지 목록
- **[.gitignore](.gitignore)** - Git 무시 파일 목록

## 🛠️ 주요 기능

### Excel 도구
- 📊 데이터 생성 및 수정
- 📈 차트 자동 생성
- 🔢 수식 자동 생성 (BMI, 날짜 변환 등)
- 📋 피벗 테이블 생성
- 🔍 VLOOKUP 자동 설정

### 파일 시스템 도구
- 📁 파일 및 디렉토리 관리
- 📝 파일 내용 읽기/쓰기
- 🔍 파일 검색 및 필터링
- 🔐 권한 관리

### 검색 도구
- 🌐 웹 검색
- 📄 문서 내 검색
- 🖼️ 이미지 검색
- 💻 코드 검색

### HWPX 도구
- 📝 마크다운 → 한글 문서 변환
- 🎨 제목, 단락, 목록 자동 서식
- 📄 HWPX 표준 형식 지원
- 🔄 일괄 변환 및 배치 처리

## 💡 사용 예시

### Excel에서 BMI 계산 자동화
```python
# MCP를 통해 키와 몸무게 데이터에 BMI 수식 자동 적용
# =B2/(A2/100)^2 형태의 수식을 모든 행에 자동 생성
```

### 파일 시스템 자동 정리
```python
# MCP를 통해 특정 확장자 파일들을 자동으로 분류 폴더로 이동
# 중복 파일 자동 감지 및 정리
```

### 마크다운을 한글 문서로 변환
```python
# MCP를 통해 마크다운 파일을 HWPX 형식으로 자동 변환
# 제목, 단락, 목록 등의 서식이 자동으로 적용된 한글 문서 생성
```

## 🔧 시스템 요구사항

- **운영체제**: macOS 10.15+, Windows 10+, Linux
- **Python**: 3.8 이상
- **메모리**: 최소 4GB RAM
- **저장공간**: 최소 1GB 여유 공간
- **HWPX 도구**: 한글 2010 이상 (HWPX 파일 열기용)

## 📖 학습 순서

1. **[MCP 기본 개념 이해](guides/setup/MCP-SERVER.md)**
2. **[클라이언트 설치 및 설정](guides/setup/MCP-CLIENT.md)**
3. **[Excel 도구 사용법 학습](guides/excel/README.md)**
4. **[파일 시스템 도구 학습](guides/file-system/README.md)**
5. **[검색 도구 학습](guides/search/README.md)**
6. **[HWPX 도구 학습](guides/hwpx/README.md)**
7. **[실제 프로젝트에 적용](examples/README.md)**

## 🤝 기여하기

이 프로젝트에 기여하고 싶으시다면:

1. 이 저장소를 포크합니다
2. 새로운 기능 브랜치를 만듭니다 (`git checkout -b feature/amazing-feature`)
3. 변경사항을 커밋합니다 (`git commit -m 'Add amazing feature'`)
4. 브랜치에 푸시합니다 (`git push origin feature/amazing-feature`)
5. Pull Request를 생성합니다

## 📄 라이선스

이 프로젝트는 MIT 라이선스 하에 배포됩니다. 자세한 내용은 [LICENSE](LICENSE) 파일을 참조하세요.

## 🙏 감사의 말

- [MCP 공식 문서](https://modelcontextprotocol.io/) - MCP 프로토콜 명세
- [PyHub MCP Tools](https://mcp.pyhub.kr/) - 한국어 MCP 도구 가이드
- [Claude Desktop](https://claude.ai/download) - Claude AI 데스크톱 클라이언트
- [Cursor](https://cursor.sh/) - AI 기반 코드 에디터

## 📞 지원 및 문의

- **GitHub Issues**: [프로젝트 이슈](https://github.com/chulgil/mymcp/issues)
- **문서 개선**: [가이드 문서](guides/) 수정 제안
- **기능 요청**: [Feature Request](https://github.com/chulgil/mymcp/issues/new?template=feature_request.md)

---

**MyMCP**로 로컬 컴퓨터의 모든 도구를 AI와 함께 사용해보세요! 🚀

