package ups.edu.ec.SD;


import jakarta.*;
import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

@Path("hola")
public class microservicio {

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public String mensaje() {
        return "{\"mensaje\":\"Hola UPS\"}";
    }
}