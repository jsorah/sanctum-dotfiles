# Ha, ha, ha! ASCII!
speech=$(pks "$@") || exit
printf '\n%066s\n' '( '"$speech"' )'
cat <<'EOF'
                                                    /

                      .''''''''''''''''''''''..
                    .'''''''''''''''''''''''''''
                   .'''''''''''''''''''''''''''''
                  ,'''''''''''''''''''''''''''''''
                  '''''''''''''''''''''''''''''''':
                 ,'''''''''''##`'''''''''''''''.'''`
                 ;''''''''.###########,'''''',###'''
                 ;'''''';#################:'#####.''
                 `:''''''#########################'.
                 ::`   ,'+########################';
                 ''''''':   .#####################''
                 ''''''''.####` `;#############;##'
                 ;''''''',####,###:  +############.
               ,###''''''#############` ;##:#######
               ,#:##''';+#####+   :######  +##+    +
               ,'#;#,''#####',+###` ;####`+         
               ,#'#,#';############++. ,`##         
               :#####+:#######,@,``@@,#####'        
               ;#+#+#############++++##.#+##       +
                ###+################'####'##        
                 #######+###################.#   :.
                   ######'########################'
                   ,+#####;#######################
                   ,#######;############'####+###:
                   ,#######################+#####'
                   ,###############' `   #'#  +'#
                  #,##.###########'##+##'###'####
                ``@.############## `+#@@@@@######
              +```@@################ ,,. .  ####.
             ;````@@,##.##############':..:######
            ;`````@@@########.##################
         +````````@@@@#####;####################:
      +`````.`````@@@@######`###################```+
   +````````,`````'@@@@@##'#####################`````.
+ ``````````.``````@@@@@@##'###'################```````` +
```````````````````@@@@@@@'#####;##########,##'`````````````.+
```````````````````@@@@@@@@@+#####':####+:+'````````````````````,
```````````````````,@@@@@@@@@#:#########'@@@``````````````````````
```````````.````````@@@@@@@@@@@@#'#####@@@@@```````````````````````
```````````.````````@@@@@@@@@@@@@@'  @@@@@@@.``````````````````````
EOF
