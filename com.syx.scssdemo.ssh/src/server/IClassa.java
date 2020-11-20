package server;

import java.util.List;

import model.Classa;
import model.Profession;

public interface IClassa {

	List<Classa> show(Classa classa);

	int save(Classa classa);

	int delete(Classa classa);

	int update(Classa classa);

	List<Classa> showall(Classa classa);

}
