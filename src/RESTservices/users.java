package RESTservices;

import java.util.ArrayList;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import ConnectionManager.*;

import RESTdataEntities.*;

@Path("/users")
public class users {
			
		@GET
		@Produces(MediaType.APPLICATION_XML)
		public userEntitys resultToXML() {
			userEntitys result= new userEntitys();
			ArrayList<userEntity> MyUsers = new ArrayList<userEntity>();
			
			userEntity AUser = new userEntity();
			AUser.setName("Alex");
			MyUsers.add(AUser);
			
			AUser = new userEntity();
			AUser.setName("Yan");
			MyUsers.add(AUser);
			
			AUser = new userEntity();
			AUser.setName("Bill");
			MyUsers.add(AUser);
			
			
			result.setUsers(MyUsers);
			return result;
		}
	
}
