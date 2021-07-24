let g:jenkins_url = 'http://localhost:8080'
let g:jenkins_username = '$(JENKINS_USERNAME)'
let g:jenkins_password = '$(JENKINS_PASSWORD)'

nnoremap <leader>rj :JenkinsValidateJenkinsFile<cr>
