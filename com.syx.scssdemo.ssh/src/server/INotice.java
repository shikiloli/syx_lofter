package server;

import java.util.List;

import model.Notice;

public interface INotice {

	List<Notice> show(Notice notice);

	int save(Notice notice);

	int delete(Notice notice);

	Notice find(Notice notice);
	
	

}
