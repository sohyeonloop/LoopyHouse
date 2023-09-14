package comm.dao;

import java.util.HashMap;
import java.util.List;

import shop.vo.SearchVO;

public interface IPopSearchDao {

	// 인기검색어 첫단어 insert
	public int insertPopSearch(SearchVO sv);

	// 인기검색어 있는 단어 update
	public int popSearchUpdate(SearchVO sv);

	// 검색어 중복확인
	public boolean popSearchCheck(String setSchWord);

	// 인기검색어 정렬
	public List<SearchVO> popSearchSelect();
}
