# Exercice 1A
UsernameInputBox = "name:username"
PasswordInputBox = "name:password"
LoginButton = "xpath://button[@type='submit']"
TitleDashboard = "xpath://span/h6"

# Exercice 1B
LoginErrorMessage = "xpath://p[contains(@class, 'oxd-alert-content-text')]"

# Exercice 2
MenusText = "xpath://li[@class='oxd-main-menu-item-wrapper']//child::span"
# MenuLink = "xpath://li[@class='oxd-main-menu-item-wrapper']//child::span[text()='${MENU}']"

# Exercice 3 & 4
EmployeeName = "//div[@class='orangehrm-edit-employee-name']/h6"
EmployeeFirstName = "name:firstName"
EmployeeLastName = "name:lastName"
DynamicMenu = "xpath://li[@class='oxd-main-menu-item-wrapper']//child::span[text()='{}']"
MyInfoSaveButton = "xpath:(//button[@type='submit' and contains(., 'Save')])[1]"
# DateOfBirthInputBox = "xpath://*[text()='Date of Birth']//following::*[@class='oxd-date-input']/input"
# DateOfBirthCalendar = "xpath://*[@class='oxd-date-input-calendar']"
# in CSS : css:.oxd-date-input-calendar
# SelectedDay = "xpath://div[@class='oxd-calendar-date --selected']"
LicenseExpiryDate = "xpath://*[text()='License Expiry Date']//following::*[@class='oxd-date-input']/input"
CloseCalendarLink = "xpath://div[@class='oxd-date-input-link --close']"
MessageContainer = "id:oxd-toaster_1"
# in CSS if it doesn't work : css:.oxd-text--toast-title
TitleSuccessMessage = "xpath://*[contains(@class,'oxd-text--toast-title')]"
# in CSS : css:.oxd-text--toast-title
SuccessMessage = "css:.oxd-text--toast-message"
# in CSS : xpath://*[contains(@class,'oxd-text--toast-message')]

# Exercice 5
DynamicTab = "xpath://span[contains(text(),'{}')]"
FirstTab = "//*[@class='oxd-dropdown-menu']/li[1]"
# in CSS : css:.oxd-dropdown-menu li:nth-child(1)
JobTitlesHeader = "xpath://div[@class='oxd-table-header']//child::div[text()='Job Titles']"
AddButton = "xpath://button[@type='button' and text()=' Add ']"
AddJobTitleLabel = "xpath://div[@class='oxd-form-row']//child::label[text()='Job Title']"
JobTitleInput = "xpath://div[@class='oxd-form-row'][1]//child::input"
JobDescriptionInput = "xpath://textarea[@placeholder='Type description here']"
JobSpecificationInput = "//*[@class='oxd-file-input']"
# in CSS : css:.oxd-file-input
NoteInput = "xpath://textarea[@placeholder='Add note']"
SaveButton = "xpath://button[@type='submit']"

# Exercice 6
DynamicJobTitle = "xpath://div[@class='oxd-table-body']//child::div[text()='{}']//ancestor::div[@class='oxd-table-card']//child::div[@class='oxd-table-card-cell-checkbox']"
DeleteSelectedButton = "xpath://button[text()=' Delete Selected ']"
YesDeleteButton = "xpath://div[@class='orangehrm-modal-footer']/button[2]"



