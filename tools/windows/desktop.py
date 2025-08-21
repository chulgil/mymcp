#!/usr/bin/env python3
"""
FastMCP를 사용한 MCP 서버 - Windows용
Python 3.11+에서 작동
"""

from fastmcp import FastMCP
import os
import shutil
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin, urlparse
import time

# MCP 서버 생성
mcp = FastMCP("mymcp-desktop-windows")

# Windows용 기본 경로 설정
BASE_PATH = "c:/test"

# 기본 폴더 생성
if not os.path.exists(BASE_PATH):
    os.makedirs(BASE_PATH)

@mcp.tool
def create_folder(folder_name: str) -> str:
    """폴더 생성"""
    folder_path = os.path.join(BASE_PATH, folder_name)
    try:
        if not os.path.exists(folder_path):
            os.makedirs(folder_path)
            return f"폴더 '{folder_name}' 가 생성되었습니다."
        else:
            return f"폴더 '{folder_name}' 는 이미 존재합니다."
    except Exception as e:
        return f"폴더 생성 중 오류 발생: {str(e)}"

@mcp.tool
def list_folders() -> list:
    """폴더 목록"""
    try:
        folders = [f for f in os.listdir(BASE_PATH) if os.path.isdir(os.path.join(BASE_PATH, f))]
        return folders
    except Exception as e:
        return [f"오류 발생: {str(e)}"]

@mcp.tool
def create_file(file_name: str, content: str = "", folder_name: str = "") -> str:
    """파일 생성"""
    try:
        if folder_name:
            file_path = os.path.join(BASE_PATH, folder_name, file_name)
            folder_path = os.path.join(BASE_PATH, folder_name)
            if not os.path.exists(folder_path):
                os.makedirs(folder_path)
        else:
            file_path = os.path.join(BASE_PATH, file_name)

        with open(file_path, "w", encoding="utf-8") as f:
            f.write(content)

        location = f"/{folder_name}/" if folder_name else "/"
        return f"파일 '{file_name}' 가 {location}에 생성되었습니다."
    except Exception as e:
        return f"파일 생성 중 오류 발생: {str(e)}"

@mcp.tool
def read_file(file_name: str, folder_name: str = "") -> str:
    """파일 읽기"""
    try:
        if folder_name:
            file_path = os.path.join(BASE_PATH, folder_name, file_name)
        else:
            file_path = os.path.join(BASE_PATH, file_name)

        if not os.path.exists(file_path):
            return f"파일 '{file_name}' 를 찾을 수 없습니다."

        with open(file_path, "r", encoding="utf-8") as f:
            content = f.read()
        return content
    except Exception as e:
        return f"파일 읽기 중 오류 발생: {str(e)}"

@mcp.tool
def read_hwp(file_name: str) -> str:
    """한글 문서(.hwp) 읽기 (Windows 전용)"""
    try:
        import olefile
    except ImportError:
        return "olefile 라이브러리가 설치되지 않았습니다. 'pip install olefile'로 설치하세요."

    file_path = os.path.join(BASE_PATH, file_name)
    try:
        if not olefile.isOleFile(file_path):
            return f"오류: '{file_path}'는 올바른 한글 문서 형식이 아닙니다."

        ole = olefile.OleFileIO(file_path)
        if ole.exists("PrvText"):
            text_stream = ole.openstream("PrvText")
            text_data = text_stream.read().decode("utf-16-le", errors="replace")
            ole.close()
            return text_data
        else:
            ole.close()
            return "텍스트 내용을 추출할 수 없습니다."
    except Exception as e:
        return f"한글 문서 읽기 오류: {str(e)}"

@mcp.tool
def get_system_info() -> str:
    """시스템 정보"""
    import platform
    import sys
    
    info = f"""
시스템 정보 (Windows):
- OS: {platform.system()} {platform.release()}
- Python: {sys.version}
- 아키텍처: {platform.machine()}
- 기본 경로: {BASE_PATH}
- 경로 존재: {os.path.exists(BASE_PATH)}
"""
    return info.strip()

if __name__ == "__main__":
    print(f"mymcp-desktop-windows 서버 시작...")
    print(f"기본 경로: {BASE_PATH}")
    mcp.run()
