package auction.repository.myfav;

import java.util.List;

import org.springframework.stereotype.Repository;

import auction.entity.myfav.View;

@Repository
public interface MyfavDao {

	int find(int user_sq, int a_sq, int art_sq);
	
	void insert(int user_sq, int a_sq, int art_sq);

	void delete(int user_sq, int a_sq, int art_sq);
	
	List<Integer> list(int user_sq);

	List<View> getMyfavList(int user_sq);

}
