package com.ict.lawving.repot.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.lawving.limit.model.vo.LimitVo;
import com.ict.lawving.repot.model.vo.RepotVo;

@Repository("repotDao")
public class RepotDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getCount() {
		int result =0;
		result=sqlSession.selectOne("repotMapper.count");
		return result;
	}

	public List<RepotVo> getList(int begin, int end) {
		List<RepotVo> repotlist=null;
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		repotlist=sqlSession.selectList("repotMapper.repotlist",map);
		return repotlist;
	}
	
}
