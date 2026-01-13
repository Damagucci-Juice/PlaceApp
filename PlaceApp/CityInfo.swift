import Foundation

struct City {
    let name: String
    let englishName: String
    let explain: String
    let image: String
    let isDomestic: Bool
}

struct CityInfo {
    let city: [City] = [
        // MARK: - 국내 도시 (Domestic - 12개)
        City(name: "서울", englishName: "Seoul", explain: "서울, 남산타워, 롯데타워, 경복궁", image: "https://images.unsplash.com/photo-1546874177-9e664107314e?w=800", isDomestic: true),
        City(name: "부산", englishName: "Busan", explain: "부산, 해운대, 광안리, 감천문화마을", image: "https://images.unsplash.com/photo-1538485399081-7191377e8241?w=800", isDomestic: true),
        City(name: "제주", englishName: "Jeju", explain: "제주, 성산일출봉, 섭지코지, 우도", image: "https://images.unsplash.com/photo-1579169326371-33a5b7d2f6b3?w=800", isDomestic: true),
        City(name: "경주", englishName: "Gyeongju", explain: "경주, 불국사, 첨성대, 동궁과월지", image: "https://images.unsplash.com/photo-1592882595561-7f0cb1f6b9b2?w=800", isDomestic: true),
        City(name: "전주", englishName: "Jeonju", explain: "전주, 한옥마을, 경기전, 전동성당", image: "https://images.unsplash.com/photo-1578037571214-25e07ed4a795?w=800", isDomestic: true),
        City(name: "강릉", englishName: "Gangneung", explain: "강릉, 경포대, 안목해변, 정동진", image: "https://images.unsplash.com/photo-1596786232430-dfe3e0d04528?w=800", isDomestic: true),
        City(name: "여수", englishName: "Yeosu", explain: "여수, 오동도, 향일암, 여수밤바다", image: "https://images.unsplash.com/photo-1599576838688-8c0f4f95e0f4?w=800", isDomestic: true),
        City(name: "대전", englishName: "Daejeon", explain: "대전, 성심당, 대전엑스포, 계족산", image: "https://images.unsplash.com/photo-1548115184-bc6544d06a58?w=800", isDomestic: true),
        City(name: "대구", englishName: "Daegu", explain: "대구, 동성로, 팔공산, 앞산전망대", image: "https://images.unsplash.com/photo-1517154421773-0529f29ea451?w=800", isDomestic: true),
        City(name: "인천", englishName: "Incheon", explain: "인천, 차이나타운, 월미도, 송도", image: "https://images.unsplash.com/photo-1578271887552-5ac3a72752bc?w=800", isDomestic: true),
        City(name: "속초", englishName: "Sokcho", explain: "속초, 설악산, 속초해변, 아바이마을", image: "https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=800", isDomestic: true),
        City(name: "통영", englishName: "Tongyeong", explain: "통영, 동피랑벽화마을, 미륵산, 케이블카", image: "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800", isDomestic: true),
        
        // MARK: - 일본 (Japan - 6개)
        City(name: "도쿄", englishName: "Tokyo", explain: "도쿄, 시부야, 신주쿠, 아사쿠사", image: "https://images.unsplash.com/photo-1540959733332-eab4deabeeaf?w=800", isDomestic: false),
        City(name: "오사카", englishName: "Osaka", explain: "오사카, 도톤보리, 오사카성, 유니버셜스튜디오", image: "https://images.unsplash.com/photo-1590559899731-a382839e5549?w=800", isDomestic: false),
        City(name: "교토", englishName: "Kyoto", explain: "교토, 기요미즈데라, 금각사, 후시미이나리", image: "https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=800", isDomestic: false),
        City(name: "후쿠오카", englishName: "Fukuoka", explain: "후쿠오카, 캐널시티, 다자이후, 하카타", image: "https://images.unsplash.com/photo-1503899036084-c55cdd92da26?w=800", isDomestic: false),
        City(name: "삿포로", englishName: "Sapporo", explain: "삿포로, 오타루, 눈축제, 비에이", image: "https://images.unsplash.com/photo-1551927336-09d50efd69cd?w=800", isDomestic: false),
        City(name: "오키나와", englishName: "Okinawa", explain: "오키나와, 츄라우미수족관, 슈리성, 나하", image: "https://images.unsplash.com/photo-1542640244-7e672d6cef4e?w=800", isDomestic: false),
        
        // MARK: - 동남아시아 (Southeast Asia - 8개)
        City(name: "방콕", englishName: "Bangkok", explain: "방콕, 왓아룬, 카오산로드, 짜뚜짝", image: "https://images.unsplash.com/photo-1508009603885-50cf7c579365?w=800", isDomestic: false),
        City(name: "싱가포르", englishName: "Singapore", explain: "싱가포르, 마리나베이샌즈, 가든스바이더베이, 센토사", image: "https://images.unsplash.com/photo-1525625293386-3f8f99389edd?w=800", isDomestic: false),
        City(name: "다낭", englishName: "Danang", explain: "다낭, 바나힐, 호이안, 미케비치", image: "https://images.unsplash.com/photo-1559592413-7cec4d0cae2b?w=800", isDomestic: false),
        City(name: "발리", englishName: "Bali", explain: "발리, 우붓, 꾸따비치, 울루와뚜", image: "https://images.unsplash.com/photo-1537996194471-e657df975ab4?w=800", isDomestic: false),
        City(name: "하노이", englishName: "Hanoi", explain: "하노이, 하롱베이, 호안끼엠호수, 올드쿼터", image: "https://images.unsplash.com/photo-1555921015-5532091f6026?w=800", isDomestic: false),
        City(name: "푸켓", englishName: "Phuket", explain: "푸켓, 파통비치, 피피섬, 팡아만", image: "https://images.unsplash.com/photo-1589394815804-964ed0be2eb5?w=800", isDomestic: false),
        City(name: "호치민", englishName: "Ho Chi Minh", explain: "호치민, 벤탄시장, 노트르담성당, 메콩델타", image: "https://images.unsplash.com/photo-1583417319070-4a69db38a482?w=800", isDomestic: false),
        City(name: "세부", englishName: "Cebu", explain: "세부, 막탄섬, 오슬롭, 카와산폭포", image: "https://images.unsplash.com/photo-1505881502353-a1986add3762?w=800", isDomestic: false),
        
        // MARK: - 중국/홍콩/대만 (China/HK/Taiwan - 4개)
        City(name: "홍콩", englishName: "Hong Kong", explain: "홍콩, 빅토리아피크, 란콰이펑, 침사추이", image: "https://images.unsplash.com/photo-1536599018102-9f803c140fc1?w=800", isDomestic: false),
        City(name: "상하이", englishName: "Shanghai", explain: "상하이, 외탄, 동방명주, 난징루", image: "https://images.unsplash.com/photo-1537531383496-f4749b96d480?w=800", isDomestic: false),
        City(name: "타이베이", englishName: "Taipei", explain: "타이베이, 타이베이101, 지우펀, 스린야시장", image: "https://images.unsplash.com/photo-1470004914212-05527e49370b?w=800", isDomestic: false),
        City(name: "마카오", englishName: "Macau", explain: "마카오, 세나도광장, 베네시안, 마카오타워", image: "https://images.unsplash.com/photo-1552912279-8faa47c35f76?w=800", isDomestic: false),
        
        // MARK: - 유럽 (Europe - 10개)
        City(name: "파리", englishName: "Paris", explain: "파리, 에펠탑, 루브르박물관, 샹젤리제", image: "https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=800", isDomestic: false),
        City(name: "런던", englishName: "London", explain: "런던, 빅벤, 타워브릿지, 버킹엄궁전", image: "https://images.unsplash.com/photo-1513635269975-59663e0ac1ad?w=800", isDomestic: false),
        City(name: "로마", englishName: "Rome", explain: "로마, 콜로세움, 트레비분수, 바티칸", image: "https://images.unsplash.com/photo-1552832230-c0197dd311b5?w=800", isDomestic: false),
        City(name: "바르셀로나", englishName: "Barcelona", explain: "바르셀로나, 사그라다파밀리아, 구엘공원, 람블라스", image: "https://images.unsplash.com/photo-1583422409516-2895a77efded?w=800", isDomestic: false),
        City(name: "암스테르담", englishName: "Amsterdam", explain: "암스테르담, 안네프랑크의집, 반고흐미술관, 운하투어", image: "https://images.unsplash.com/photo-1534351590666-13e3e96b5017?w=800", isDomestic: false),
        City(name: "프라하", englishName: "Prague", explain: "프라하, 카를교, 프라하성, 구시가광장", image: "https://images.unsplash.com/photo-1541849546-216549ae216d?w=800", isDomestic: false),
        City(name: "비엔나", englishName: "Vienna", explain: "비엔나, 쇤브룬궁전, 슈테판대성당, 벨베데레궁전", image: "https://images.unsplash.com/photo-1516550893923-42d28e5677af?w=800", isDomestic: false),
        City(name: "리스본", englishName: "Lisbon", explain: "리스본, 벨렘탑, 제로니모스수도원, 신트라", image: "https://images.unsplash.com/photo-1555881400-74d7acaacd8b?w=800", isDomestic: false),
        City(name: "밀라노", englishName: "Milan", explain: "밀라노, 두오모, 갤러리아, 스포르체스코성", image: "https://images.unsplash.com/photo-1520440229-6469a149ac59?w=800", isDomestic: false),
        City(name: "취리히", englishName: "Zurich", explain: "취리히, 반호프거리, 취리히호수, 그로스뮌스터", image: "https://images.unsplash.com/photo-1515488764276-beab7607c1e6?w=800", isDomestic: false),
        
        // MARK: - 미주 (Americas - 6개)
        City(name: "뉴욕", englishName: "New York", explain: "뉴욕, 타임스퀘어, 자유의여신상, 센트럴파크", image: "https://images.unsplash.com/photo-1496442226666-8d4d0e62e6e9?w=800", isDomestic: false),
        City(name: "로스앤젤레스", englishName: "Los Angeles", explain: "LA, 할리우드, 산타모니카, 그리피스천문대", image: "https://images.unsplash.com/photo-1534190760961-74e8c1c5c3da?w=800", isDomestic: false),
        City(name: "샌프란시스코", englishName: "San Francisco", explain: "샌프란시스코, 금문교, 피셔맨스워프, 알카트라즈", image: "https://images.unsplash.com/photo-1501594907352-04cda38ebc29?w=800", isDomestic: false),
        City(name: "하와이", englishName: "Hawaii", explain: "하와이, 와이키키, 다이아몬드헤드, 진주만", image: "https://images.unsplash.com/photo-1507876466758-bc54f384809c?w=800", isDomestic: false),
        City(name: "라스베이거스", englishName: "Las Vegas", explain: "라스베가스, 스트립, 그랜드캐년, 후버댐", image: "https://images.unsplash.com/photo-1605833556294-ea5c7a74f57d?w=800", isDomestic: false),
        City(name: "토론토", englishName: "Toronto", explain: "토론토, CN타워, 나이아가라폭포, 로저스센터", image: "https://images.unsplash.com/photo-1517935706615-2717063c2225?w=800", isDomestic: false),
        
        // MARK: - 오세아니아 (Oceania - 2개)
        City(name: "시드니", englishName: "Sydney", explain: "시드니, 오페라하우스, 하버브릿지, 본다이비치", image: "https://images.unsplash.com/photo-1506973035872-a4ec16b8e8d9?w=800", isDomestic: false),
        City(name: "멜버른", englishName: "Melbourne", explain: "멜버른, 그레이트오션로드, 플린더스역, 야라강", image: "https://images.unsplash.com/photo-1514395462725-fb4566210144?w=800", isDomestic: false),
        
        // MARK: - 중동/아프리카 (Middle East/Africa - 2개)
        City(name: "두바이", englishName: "Dubai", explain: "두바이, 부르즈칼리파, 팜주메이라, 두바이몰", image: "https://images.unsplash.com/photo-1512453979798-5ea266f8880c?w=800", isDomestic: false),
        City(name: "이스탄불", englishName: "Istanbul", explain: "이스탄불, 아야소피아, 블루모스크, 그랜드바자르", image: "https://images.unsplash.com/photo-1524231757912-21f4fe3a7200?w=800", isDomestic: false),
    ]
}


// MARK: - 필터링 헬퍼 메서드
extension CityInfo {
    /// 국내 여행지만 필터링
    var domesticCities: [City] {
        return city.filter { $0.isDomestic == true }
    }
    
    /// 해외 여행지만 필터링
    var internationalCities: [City] {
        return city.filter { $0.isDomestic == false }
    }
    
    /// 도시 이름으로 검색
    func searchCity(keyword: String) -> [City] {
        return city.filter {
            $0.name.contains(keyword) ||
            $0.englishName.lowercased().contains(keyword.lowercased()) ||
            $0.explain.contains(keyword)
        }
    }
}
