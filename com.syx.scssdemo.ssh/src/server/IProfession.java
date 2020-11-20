package server;

import java.util.List;

import model.Classa;
import model.Profession;

public interface IProfession {

	List<Profession> show(Profession profession);

	int save(Profession profession);

	int delete(Profession profession);

	int update(Profession profession);

	List<Profession> showall(Profession profession);


}
