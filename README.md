# BlogProject

## 개발기간
2021.05.17 ~ 2021.06.02

## 개발환경
- Eclipse IDE(2021-03)
- spring MVC
- tomcat9.0
- Dynamic Web Module(4.0)
- java(1.8)
- Lombok(1.18.2)
- jQuery(3.6.0)
- jstl
## 설치 

### Lombok
1. https://projectlombok.org/download 에서 설치

2. 다운로드한 lombok.jar파일 실행하기
 - cmd에서 다운로드 경로로 이동 후, 아래 명령어로 lombok.jar ex) 실행설치 경로> java -jar lombok.jar

3. 다음 화면에서 필요한 IDE를 선택 후 설치
 - Specify location...`을 눌러 Eclipse 설치 경로 선택 후, Install 클릭
 - 설치가 끝나면 Eclipse의 실행 경로에 lombok.jar 파일이 추가된 것을 확인할 수 있다
 
4. 이클립스 재실행

## Lombok 설치 후 이클립스가 실행 안되는 경우 해결 방법
1. 이클립스 바로가기가 아닌 이클립스가 설치된 경로에서 이클립스가 정상적으로 실행되는지 확인해본다. 실행된다면, 바로가기 삭제 후 다시 생성

2. 위 방법으로 해결이 안된다면, 이클립스 설치 경로에서 eclipse.ini파일을 열어 아래 부분의 경로가 정확한지 확인해본다. 이클립스 실행 경로에 설치한 lombok.jar의 위치를 적어줘야 한다.

## 기능구현
- 카테고리 기능(카테고리 생성, 수정, 삭제)

- 글(쓰기, 수정, 삭제, 공감(좋아요),  검색, 페이징)

- 댓글(쓰기, 수정, 삭제)

- 회원(가입, 수정, 삭제)

- 프로필(수정, 삭제, 이미지 업로드)

- 방문자(today, total), 방명록
