import pandas as pd
import pymysql


def title_searching():
    sql = """select t.primary_title, t.original_title
from title_main t
where t.primary_title = 'My Better Halves' or t.original_title = 'My Better Halves';
    """
    curs1.execute(sql)
    rows = curs1.fetchone()
    while rows:
        print("홍보용 제목 : %s, 실제 제목 : %s"%(rows['primary_title'], rows['original_title']))
        rows = curs1.fetchone()

def actor_rating_searching():
    sql = """select t.original_title, r.average_rating
from principals c, people_main p, title_main t, rating_data r
where c.name_id = p.name_id and  c.title_id = t.title_id and
t.title_id = r.title_id and c.job_category= 'actor' and p.name_ = 'Charles Kayser';
    """
    curs1.execute(sql)
    rows = curs1.fetchone()
    while rows:
        print("영화 이름 : %s, 평점 : %s" %(rows['original_title'], rows['average_rating']))
        rows = curs1.fetchone()


def director_year_searching():
    sql = """select t.original_title , t.start_year
from title_main t, principals c, people_main p
where t.title_id = c.title_id and c.name_id  = p.name_id and c.job_category = 'director' and p.name_ = 'William Heise'
order by t.start_year;
    """
    curs1.execute(sql)
    rows = curs1.fetchone()
    while rows:
        print("영화 제목 : %s, 개봉연도 : %s"%(rows['original_title'], rows['start_year']))
        rows = curs1.fetchone()

def drama_voted_searching():
    sql = """select t.original_title, r.num_votes
from title_genres g, title_main t, rating_data r
where g.title_id = t.title_id and t.title_id = r.title_id and g.genre = 'Drama\r'
order by r.num_votes desc
limit 300;
"""
    curs1.execute(sql)
    rows = curs1.fetchone()
    while rows:
        print("영화 제목 : %s, 리뷰수 : %s" %(rows['original_title'], rows['num_votes']))
        rows = curs1.fetchone()


def drama_rating_searching():
    sql = """select t.original_title, t.primary_title, r.average_rating
from title_genres g, title_main t, rating_data r
where g.title_id = t.title_id and t.title_id = r.title_id and g.genre = 'Drama\r'
order by r.average_rating desc
limit 300;"""
    curs1.execute(sql)
    rows = curs1.fetchone()
    while rows:
        print("영화 제목 : %s, 평점 : %s" %(rows['original_title'], rows['average_rating']))
        rows = curs1.fetchone()


def movie_actor_searching():
    sql = """select p.name_, j.role_
from people_main p, title_main t, principals c, movie_job j
where p.name_id = c.name_id and t.title_id = c.title_id and j.title_id = t.title_id and j.name_id = p.name_id
 and c.job_category = 'actor' and t.original_title = 'The Great Train Robbery';"""

    curs1.execute(sql)
    rows = curs1.fetchone()
    while rows:
        print("배우 이름 : %s, 작중 캐릭터 이름 %s"%(rows['name_'], rows['role_']))
        rows = curs1.fetchone()

def best_of_movie_searching():
    sql = """
    select t.original_title, t.start_year, t.runtime_minutes, r.average_rating, r.num_votes
from title_main t, rating_data r
where t.title_id = r.title_id and r.num_votes >= 1000000
order by r.num_votes desc;"""
    curs1.execute(sql)
    rows = curs1.fetchone()
    while rows:
        print("영화 제목 : %s, 개봉연도 : %s, 상영시간 : %s, 평점 : %s, 리뷰수 : %s"%(rows['original_title'], rows['start_year'], rows['runtime_minutes'], rows['average_rating'], rows['num_votes']))
        rows = curs1.fetchone()
def vote_movie():
    sql = """select distinct t.original_title, r.average_rating, r.num_votes
from title_main t, rating_data r
where t.title_id = r.title_id and t.title_type = 'movie' and t.original_title = 'Expansivas';"""
    curs1.execute(sql)
    rows = curs1.fetchone()

    aver = float(rows['average_rating'])
    vote = int(rows['num_votes'])
    print("영화 제목 : %s  총 평점 : %.1f  총 투표 수 : %d"%(rows['original_title'], aver, vote))
    n = int(input("몇 점을 주시겠습니까?"))
    aver = ((aver * vote) + n) / (vote+1)
    sql1 = """update rating_data
    set num_votes = num_votes + 1, average_rating = %.1f
    where title_id = tt9344454
    """%(aver)
    print("결과 ==> 영화 제목 : %s  총 평점 : %.1f  총 투표 수 : %d"%(rows['original_title'], aver, vote + 1))
    conn1.commit()


conn1 = pymysql.connect(host= 'localhost', port=3300, user='root', password = 'dufdlf000', db = 'university')
curs1 = conn1.cursor(pymysql.cursors.DictCursor)
while(1):
    print("""항목을 선택해주세요 
1. 영화제목에 따른 영화 검색   2. 특정 배우가 등장 하는 영화 별점 검색    3. 특정 감독이 제작한 영화 개봉연도순 검색 
4. Drama장르 영화 리뷰순 검색    5. Drama장르 영화 평점순 검색    6. 특정 영화를 연기한 배우 모두 출력
7. 리뷰가 1,000,000개 이상인 영화의 리스트 높은 순으로 출력   8. 특정 영화 평점 주기  0. 종료""")
    n = int(input())
    if(n == 1):
        title_searching()
    elif(n == 2):
        actor_rating_searching()
    elif(n == 3):
        director_year_searching()
    elif(n == 4):
        drama_voted_searching()
    elif(n == 5):
        drama_rating_searching()
    elif(n == 6):
        movie_actor_searching()
    elif(n == 7):
        best_of_movie_searching()
    elif(n == 8):
        vote_movie()
    elif(n == 0):
        break;


conn1.commit()
curs1.close()
conn1.close()