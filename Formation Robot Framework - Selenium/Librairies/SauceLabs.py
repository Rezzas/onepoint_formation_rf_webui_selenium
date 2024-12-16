import base64
import re
import requests
import simplejson as json
# Il est nécessaire d'installer la librairie simplejson dans les settings

from robot.libraries.BuiltIn import BuiltIn

USERNAME_ACCESS_KEY = re.compile('^(http|https):\/\/([^:]+):([^@]+)@')


def update_test(payload, remote_url='', job_name=''):
    # Parse username and access_key from the remote_url
    assert USERNAME_ACCESS_KEY.match(remote_url), 'Incomplete remote_url.'
    username, access_key = USERNAME_ACCESS_KEY.findall(remote_url)[0][1:]

    # Get selenium session id from the keyword library
    selenium = BuiltIn().get_library_instance('SeleniumLibrary')
    job_id = selenium.driver.session_id

    # Prepare headers
    auth_info = '{}:{}'.format(username, access_key)
    token = base64.b64encode(auth_info.encode('utf-8')).decode('utf-8')
    headers = {'Authorization': 'Basic {0}'.format(token)}

    # Put test status to Sauce Labs
    # Liste des endpoints de l'API SauceLabs : https://docs.saucelabs.com/dev/api/jobs/
    url = 'https://api.eu-central-1.saucelabs.com/rest/v1/{0}/jobs/{1}'.format(username, job_id)
    response = requests.put(url, data=json.dumps(payload), headers=headers)
    assert response.status_code == 200, response.text

    print("SauceOnDemandSessionID=%s job-name=%s" % (job_id, job_name))
