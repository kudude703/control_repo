class minecraft {
  file {'/opt/minecraft':
    ensure => directory,
  }
  
  file {'/opt/minecraft/minecraft_server.1.13.2.jar':
    ensure => file,
    source => 'https://launcher.mojang.com/v1/objects/3737db93722a9e39eeada7c27e7aca28b144ffa7/server.jar',
  }
  
  package {'java':
    ensure => present,
  }
  
  file {'/opt/minecraft/eula.txt':
    ensure => file,
    content => 'eula=true',
  }
  
  file {'/etc/systemd/sysmtem/minecraft.service':
    ensure => file,
    source => 'puppet:///modules/minecraft/minecraft.service',
  }
}
