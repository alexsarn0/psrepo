﻿New-AzureRmDnsRecordSet -Name www -RecordType A -ZoneName <zone name> -ResourceGroupName <DNS Group> -Ttl 3600 -DnsRecords (New-AzureRmDnsRecordConfig -IPv4Address "n.n.n.n")