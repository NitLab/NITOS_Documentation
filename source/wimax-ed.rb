defProperty('runtime',20,"Time in second for the experiment is to run")
defProperty('client',"192.168.55.48","IP address of iperf server")
defProperty('interval', "1", "Interval of Iperf measurements")
defProperty('sender', 'omf.nitos.node043', "ID of sender node")
defProperty('receiver', 'omf.nitos.node048', "ID of sender node")

defGroup('Sender', property.sender) do | node |
  node.net.t0.channel = "2590000,10"
  node.addApplication("test:app:iperf-5.4") do | app |
    app.setProperty('client', property.client)
    app.setProperty('interval', property.interval)
    app.setProperty('time', property.runtime)
    app.setProperty('udp', true)
    app.measure('transfer', :samples =>1)
  end
end

defGroup('Receiver', property.receiver) do | node |
  node.net.t0.channel = "2590000,10"
  node.addApplication("test:app:iperf-5.4") do | app |
    app.setProperty('server', true)
    app.setProperty('interval', property.interval)
    app.setProperty('udp', true)
    app.measure('transfer', :samples =>1)
  end
end


onEvent(:ALL_UP_AND_INSTALLED) do | event |
  wait 50
  info "This is an iperf  experiment using a teltonika modem"
  allGroups.startApplications
  wait property.runtime
  wait 2
  allGroups.stopApplications
  wait 2
  Experiment.done
end
