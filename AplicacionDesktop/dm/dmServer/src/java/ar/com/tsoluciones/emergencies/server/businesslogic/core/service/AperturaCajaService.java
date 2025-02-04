package ar.com.tsoluciones.emergencies.server.businesslogic.core.service;

import java.util.HashMap;
import java.util.Map;
import java.util.prefs.AbstractPreferences;
import java.util.prefs.Preferences;

import ar.com.tsoluciones.arcom.cor.ServiceException;
import ar.com.tsoluciones.arcom.hibernate.HibernateService;
import ar.com.tsoluciones.arcom.hibernate.Transactional;
import ar.com.tsoluciones.arcom.security.User;
import ar.com.tsoluciones.arcom.security.services.implementation.UserService;
import ar.com.tsoluciones.arcom.security.services.proxyinterface.UserServiceInterface;
import ar.com.tsoluciones.emergencies.server.businesslogic.core.service.proxyinterface.AperturaCajaServiceInterface;


public class AperturaCajaService implements AperturaCajaServiceInterface {
	/**
	 * Logea un usuario en el sistema
	 * @throws ServiceException 
	 * @throws ServiceException 
	 *
	 */

	@Transactional
	public User altaHuellaDigital(String username, String password, String huella, String huellaAlternativa ) throws ServiceException{
		
		UserServiceInterface userServiceInterface = new UserService();
		User user = userServiceInterface.getUserByUserName(username);
		
		if( user == null || !user.getPassword().equals(password) )
			throw new ServiceException("Usuario y/o Password Incorrectos. Por favor Reintente nuevamente");

		// Es primer logueo?
		if( user.getHuelladigital() == null  ){
			user.setHuelladigital(MyBase64.decode(huella));
			user.setHuelladigitalAlternativa(MyBase64.decode(huellaAlternativa));
			HibernateService.updateObject(user);
			return user;
		}else
			throw new ServiceException("No puede realizar el alta de su huella digital por que usted ya lo realiz� alguna vez");

	
	}

	public static class MyBase64 {
	     private static class MyPreferences extends AbstractPreferences {
	         private Map<String,String> map = new HashMap<String,String>();
	         MyPreferences() { super(null,""); }
	         protected void putSpi(String key,String value) { map.put(key,value); }
	         protected String getSpi(String key) { return map.get(key); }
	         protected void removeSpi(String key) { map.remove(key); }
	         protected void removeNodeSpi() { }
	         protected String[] keysSpi() { return null; }
	         protected String[] childrenNamesSpi() { return null; }
	         protected AbstractPreferences childSpi(String key) { return null; }
	         protected void syncSpi() {}
	         protected void flushSpi() {}
	     }
	     static String encode(byte[] ba) {
	         Preferences p = new MyPreferences();
	         p.putByteArray("",ba);
	         return p.get("",null);
	     }
	     static byte[] decode(String s) {
	         Preferences p = new MyPreferences();
	         p.put("",s);
	         return p.getByteArray("",null);
	     }
	
	 }

}
