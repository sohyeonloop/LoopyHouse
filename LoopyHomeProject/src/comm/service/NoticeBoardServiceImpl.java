package comm.service;

import java.util.List;
import java.util.Map;

import comm.dao.InoticeBoardDao;
import comm.dao.NoticeBoardDaoImpl;
import comm.vo.NoticeVO;

public class NoticeBoardServiceImpl implements INoticeBoardService {
	
	private InoticeBoardDao notDao;
	private static INoticeBoardService notService;
	
	private NoticeBoardServiceImpl() {
		notDao = NoticeBoardDaoImpl.getInstance();
	}
		
	public static INoticeBoardService getInstance() {
		if(notService == null) notService = new NoticeBoardServiceImpl();
		return notService;
	}
		

	@Override
	public int countNBoardList() {
		
		int countList = 0;
		
		countList = notDao.countNBoard();

		return countList;
	}

	@Override
	public List<NoticeVO> getAllNBoard(Map<String, Object> map) {
		List<NoticeVO> boardList = null;
		boardList = notDao.noticeBoardList(map);
		
		for(NoticeVO a : boardList) {
			System.out.println("------------------------------------------");
			System.out.println();
			
//			System.out.println(a.getBdCode());
//			System.out.println(a.getCustId());
//			System.out.println(a.getInqContent());
//			System.out.println(a.getInqDate());
//			System.out.println(a.getInqNo());
//			System.out.println(a.getInqTitle());
//			System.out.println(a.getInqViews());
			
			System.out.println();
			System.out.println("------------------------------------------");
		}
		System.out.println();
		
		
		
		return boardList;
	}


	
	@Override
	public int registNotice(NoticeVO nv) {
		return notDao.insertNotice(nv);
	}

	@Override
	public int modifyNotice(NoticeVO nv) {
		return notDao.updateNotice(nv);
	}

	@Override
	public int removeNotice(NoticeVO nv) {
		return notDao.deleteNotice(nv);
	}

	@Override
	public int increaseNoticeViews(NoticeVO nv) {
		return notDao.updateNoticeViews(nv);
	}

	@Override
	public List<NoticeVO> getRecentNotice(int boardCount) {
		return notDao.selectRecentNotice(boardCount);
	}


	

	





	
	
}
