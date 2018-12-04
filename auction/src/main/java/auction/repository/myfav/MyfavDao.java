package auction.repository.myfav;

import java.util.List;

import org.springframework.stereotype.Repository;

import auction.entity.myfav.View;

@Repository
public interface MyfavDao {

	void insert(int a_sq, int art_sq);

	int find(int a_sq, int art_sq);

	void delete(int a_sq, int art_sq);
	
	List<Integer> list(int user_no);

	List<View> getMyfavList(int user_no);

}
