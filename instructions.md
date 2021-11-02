# bolttech Candidate Screening REST Service

Thank you for your interest in being part of bolttech! You've probably reached here because someone shared with you the link to this page after your job application with us.

Part of our hiring process requires you to submit your application by writing a small program to submit your details to us. It's pretty simple - just two REST API calls.

**NOTE: you have to complete the two requests under 12 seconds!**

Hint: You will need to be doing this programmatically, as it will be hard to complete the challenge within the time limit if you go the manual route. If you prefer to use a tool such as Postman, you may want to consider using [its environment variables and request chaining](https://blog.postman.com/extracting-data-from-responses-and-chaining-requests/).

## First API Call - Get a List of Numbers to Sum

Make a `HTTP GET` to `https://evening-brook-34199.herokuapp.com/application` to get a JSON like the below.

```json
{
    "id": "7276f591-d71a-48c4-ab72-a32dadca5f53",
    "nums": [
        8051,
        4778,
        4502,
        2949,
        1234
    ]
}
```

Where:

- `id` - the ID of the "question" you will need to include when submitting your answers in the second REST API call.
- `nums` - the list of integers you need to sum as the answer in the second REST API call.

## Second API Call - Submitting Your Application With the Answer and Your Resume/CV

Make a `HTTP POST` to `https://evening-brook-34199.herokuapp.com/application` to submit your job application with us.

The POST request must be of type `multipart/form-data` and must contain the following parts:

### Multipart Request - First Part

The name of this part must be `application` and it should be of `application/json` content type. The JSON must be in the following structure.

```json
{
    "applicant": {
        "firstName": "$firstName",
        "lastName": "$lastName"
    },
    "role": "$role",
    "referrer": "$referrer",
    "answer": {
        "questionId": "$questionId",
        "sum": $answer
    }
}
```

Where:

- `$firstName` is your first name.
- `$lastName` is your last name.
- `$role` is a free form text that describe the role you are applying for.
- `$referrer` is a free form text that identifies the name of the company or person that referred you to this exercise. Please specify `N/A` if not applicable.
- `$questionId` is the ID of the question you get from the first request.
- `$answer` is the integer that is the sum of the array of ints you got from the first request.

### Multipart Request - Second Part
The name of this part must be `file` and its content should be the resume/CV that you plan to upload. The content type should be `appliation/octet-stream`.

**Note: Please remove all salary information from your resume/CV before upload.**

### Multipart Request - Third Part
The name of this part must be `source` and its content should be a `.zip` archive of the code you wrote to submit the job application. 

If you are using a tool like Postman, you can export the code out from Postman. Then, package it in zip format and upload it as a file part here.

If you are using tools that do not allow you to export code, you can attach a zip file containing a Word document that describes how you used the tool to submit the application. You may include screenshots.

Please make sure the file is less than 6MB.

## Successful Submission
To successfully submit your job application with us, you must complete the HTTP requests within the stipulated time. Also, there will be validations done on the second requests - any failed validation will result in an error message that will guide you what you need to fix.

On a successful submission, you will be given a reference number in the format of `HRG-xxx` which you can then provide if ever asked for.

Good luck! Looking forward to your submission!
