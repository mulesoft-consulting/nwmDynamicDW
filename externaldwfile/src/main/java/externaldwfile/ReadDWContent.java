package externaldwfile;

import org.mule.api.MuleEventContext;
import org.mule.api.MuleMessage;
import org.mule.api.lifecycle.Callable;

import includedweavefiles.AnchorClass;

public class ReadDWContent implements Callable {

	@Override
	public Object onCall(MuleEventContext eventContext) throws Exception {
		MuleMessage message = eventContext.getMessage();
		message.setInvocationProperty("dwContent", org.mule.util.IOUtils.getResourceAsString(message.getInboundProperty("transformset") + ".dwl", AnchorClass.class));
		return message.getPayload();
	}
}
