package com.project.member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.jdbc.ConnectionProvider;
import com.project.member.dao.MemberDao;
import com.project.member.domain.ListViewData;
import com.project.member.domain.MemberInfo;
import com.project.member.domain.SearchParam;

@Service("listServcie")
public class MemberListService {

	@Autowired
	private MemberDao dao;

	final int MEMBER_CNT_List = 3;

	public ListViewData getListData(int currentPageNumber, SearchParam searchParam) {

		ListViewData listData = new ListViewData();

		Connection conn = null;

		try {
			conn = ConnectionProvider.getConnection();

			// 현재 페이지 번호
			listData.setCurrentPageNumber(currentPageNumber);

			// 전체 게시물의 개수
			int totalCnt = dao.selectTotalCount(conn, searchParam);

			int totalPageCnt = 0;
			// 전체 페이지 개수
			if (totalCnt > 0) {
				totalPageCnt = totalCnt / MEMBER_CNT_List;
				if (totalCnt % MEMBER_CNT_List > 0) {
					totalPageCnt++;
				}
			}
			listData.setPageTotalCount(totalPageCnt);

			// 구간 검색을 위한 index
			// 1 -> 0 , 2 -> 3, 3 -> 6, 4 -> 9
			int index = (currentPageNumber - 1) * MEMBER_CNT_List;
			// 회원 정보 리스트
			List<MemberInfo> memberList = null;
//			
//			if(searchParam != null) {
//				switch (searchParam.getStype()) {
//					case "both":
//						memberList = dao.selectListByBoth(conn, index, MEMBER_CNT_List, searchParam);
//					break;
//					case "id":
//						memberList = dao.selectListById(conn, index, MEMBER_CNT_List, searchParam);
//					break;
//					case "name":
//						memberList = dao.selectListByName(conn, index, MEMBER_CNT_List, searchParam);
//					break;
//				}
//			} else {
//				memberList = dao.selectList(conn, index, MEMBER_CNT_List);
//			}
//			
			if (searchParam == null) {
				memberList = dao.selectList(conn, index, MEMBER_CNT_List);
			} else if (searchParam.getStype().equals("both")) {
				memberList = dao.selectListByBoth(conn, index, MEMBER_CNT_List, searchParam);
			} else if (searchParam.getStype().equals("id")) {
				memberList = dao.selectListById(conn, index, MEMBER_CNT_List, searchParam);
			} else if (searchParam.getStype().equals("name")) {
				memberList = dao.selectListByName(conn, index, MEMBER_CNT_List, searchParam);
			}

			listData.setMemberList(memberList);

			// 1 -> 9-0 =9, 2 -> 9-3=6
			int no = totalCnt - index;
			listData.setNo(no);

			listData.setTotalCount(totalCnt);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return listData;

	}

}
