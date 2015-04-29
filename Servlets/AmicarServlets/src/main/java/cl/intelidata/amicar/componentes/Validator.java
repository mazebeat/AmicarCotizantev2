package cl.intelidata.amicar.componentes;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cl.intelidata.amicar.util.MCrypt;

/**
 *
 * @author Maze
 */
public class Validator {

    /**
     *
     */
    public static Logger logger = LoggerFactory.getLogger(Validator.class);

    /**
     *
     * @param user
     * @param process
     * @return
     */
    public Boolean validateInputs(String user, String process) {
        return user != null && process != null;
    }

    /**
     *
     * @param input
     * @return
     */
    public String desencryptInput(String input) {
        String decrypted = null;
        try {
            MCrypt mcrypt = new MCrypt();
            decrypted = new String(mcrypt.decrypt(input)).trim();
        } catch (Exception e) {
            logger.error(e.getMessage() + " {}", e);
        }

        return decrypted;
    }

    /**
     *
     * @param input
     * @return
     */
    public String encryptInputs(String input) {
        String encrypted = null;
        try {
            MCrypt mcrypt = new MCrypt();
            encrypted = MCrypt.bytesToHex(mcrypt.encrypt(input)).trim();
        } catch (Exception e) {
            logger.error(e.getMessage() + " {}", e);
        }

        return encrypted;
    }
}
