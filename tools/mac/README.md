# macOS용 MCP 서버

## 개요
macOS 환경에서 실행되는 MCP (Model Context Protocol) 서버입니다.

## 특징
- **FastMCP 기반**: 현대적이고 빠른 MCP 서버 구현
- **macOS 최적화**: macOS 경로 구조와 권한 시스템에 맞춤
- **기본 기능**: 파일/폴더 관리, 시스템 정보 조회

## 설치
```bash
cd tools/mac
pip install -r requirements.txt
```

## 실행
```bash
python3 desktop.py
```

## 지원 도구
- `create_folder`: 폴더 생성
- `list_folders`: 폴더 목록 조회
- `create_file`: 파일 생성
- `read_file`: 파일 읽기
- `get_system_info`: 시스템 정보 조회

## 기본 경로
`~/Desktop/mymcp-test/`

## 요구사항
- Python 3.11+
- macOS 10.15+
