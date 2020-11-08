package chat;

import com.nexmo.client.NexmoClient;
import com.nexmo.client.insight.AdvancedInsightResponse;
import com.nexmo.client.insight.RoamingDetails;

public class Example {

	public static void main(String[] args) {
		
		NexmoClient client = NexmoClient.builder()
				  .apiKey("05654c29")
				  .apiSecret("qmkKSSLgAho75hVb")
				  .build();
		
		AdvancedInsightResponse response = client.getInsightClient()
				  .getAdvancedNumberInsight("821092880804");

				System.out.println("BASIC INFO:");
				System.out.println("International format: " + response.getInternationalFormatNumber());
				System.out.println("National format: " + response.getNationalFormatNumber());
				System.out.println("Country: " + response.getCountryName() + " (" + response.getCountryCodeIso3() + ", +"+ response.getCountryPrefix() + ")");
				System.out.println();
				System.out.println("STANDARD INFO:");
				System.out.println("Current carrier: " + response.getCurrentCarrier().getName());
				System.out.println("Original carrier: " + response.getOriginalCarrier().getName());

				System.out.println();
				System.out.println("ADVANCED INFO:");
				System.out.println("Validity: " + response.getValidNumber());
				System.out.println("Reachability: " + response.getReachability());
				System.out.println("Ported status: " + response.getPorted());

				RoamingDetails roaming = response.getRoaming();
				if (roaming == null) {
				    System.out.println("- No Roaming Info -");
				} else {
				    System.out.println("Roaming status: " + roaming.getStatus());
				    if (response.getRoaming().getStatus() == RoamingDetails.RoamingStatus.ROAMING) {
				        System.out.print("    Currently roaming in: " + roaming.getRoamingCountryCode());
				        System.out.println(" on the network " + roaming.getRoamingNetworkName());
				    }
				}

	}

}
