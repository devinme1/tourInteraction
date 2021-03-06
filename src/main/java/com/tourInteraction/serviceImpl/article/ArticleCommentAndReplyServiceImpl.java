package com.tourInteraction.serviceImpl.article;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import com.tourInteraction.config.GlobalConstantKey;
import com.tourInteraction.dao.MessageRemindDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tourInteraction.dao.article.ArticleCommentAndReplyDao;
import com.tourInteraction.dao.article.ArticleDao;
import com.tourInteraction.entity.article.ArticleComment;
import com.tourInteraction.entity.article.ArticleReply;
import com.tourInteraction.service.article.IArticleCommentAndReplyService;

@Service("articleCommentAndReplyServiceImpl")
public class ArticleCommentAndReplyServiceImpl implements IArticleCommentAndReplyService {

	@Resource
	private ArticleCommentAndReplyDao articleCommentAndReplyDao;

	@Autowired
	@Qualifier("articleDao")
	private ArticleDao articleDao;

	@Autowired
	private MessageRemindDao messageRemindDao;
	@Override
	@Transactional(readOnly=true)
	@Cacheable("articleCommentAndReplyCache")
	public Map<String, Object> getArticleComment(String limit, String offset, int articleId,String getMethod) {
		// TODO Auto-generated method stub
		int commentCount = articleCommentAndReplyDao.getArticleCommentCount(articleId);
		List<ArticleComment> list = articleCommentAndReplyDao.getArticleComment(limit, offset, articleId, getMethod);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("count", commentCount);
		map.put("list", list);
		return map;
	}

	@Override
	@Transactional(readOnly=true)
	@Cacheable("articleCommentAndReplyCache")
	public Map<String, Object> getArticleReply(Map<String,Object> mapCondition) {
		// TODO Auto-generated method stub
		int replyCount = articleCommentAndReplyDao.getArticleReplyCount((Integer) mapCondition.get("commentId"));
		List<ArticleReply> list = articleCommentAndReplyDao.getArticleReply(mapCondition);
		Map<String, Object> map = new HashMap<String , Object>();
		map.put("list", list);
		map.put("count", replyCount);
		return map;
	}

	@Override
	@Transactional
	@CacheEvict(value = "articleCommentAndReplyCache",allEntries = true)
	public int addArticleComment(Map<String, Object> map) {
		int num = articleDao.updateArticleCommentCount((Integer)map.get("articleId"),1);
		num = articleCommentAndReplyDao.addArticleComment(map);
		map.put("type","article");
		map.put("remindLinkId",map.get("articleId"));
		map.put("remindPosition",GlobalConstantKey.MESSAGE_REMIND_PRE_ARTICLE+map.get("id"));
		num = messageRemindDao.insertMessageRemind(map);

		return num;
	}

	@Override
	@CacheEvict(value = "articleCommentAndReplyCache",allEntries = true)
	public int updateArticleComment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return articleCommentAndReplyDao.updateArticleComment(map);
	}

	@Override
	@Transactional
	@CacheEvict(value = "articleCommentAndReplyCache",allEntries = true)
	public int addCommentReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int num = articleCommentAndReplyDao.updateArticleComment(map);
		num = articleCommentAndReplyDao.addCommentReply(map);
		map.put("type","article");
		map.put("remindLinkId",map.get("articleId"));
		map.put("remindPosition",GlobalConstantKey.MESSAGE_REMIND_PRE_ARTICLE+map.get("commentId"));
		num = messageRemindDao.insertMessageRemind(map);
		return num;
	}


}
