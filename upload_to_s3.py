## Testing environment
# import boto3
# 
# try:
#    s3_client = boto3.client("s3")
#    print("boto3 is working well!")
# except Exception as e:
#    print(f"Error to connect in boto3: {e}")

import boto3

s3_client = boto3.client(
    "s3",
    aws_access_key_id=os.getenv("AWS_ACCESS_KEY_ID"),
    aws_secret_access_key=os.getenv("AWS_SECRET_ACCESS_KEY"),
)

file_path = "/Users/geanpannellini/Documents/Cases/<company>/menu_counts_202503110939.csv"
s3_key = "case_gean_pannellini_burrito_taco_ratio.csv"

s3_client.upload_file(file_path, "<company>-case-study", s3_key)

print(f"File {file_path} sent to S3 as {s3_key}")