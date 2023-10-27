import logging
import azure.functions as func

def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')

    first_name = req.params.get('first_name')
    last_name = req.params.get('last_name')

    # Check if 'full_name' is provided in the request parameters
    if 'full_name' in req.params:
        full_name = req.params.get('full_name')
    else:
        full_name = None

    if not full_name:
        try:
            req_body = req.get_json()
        except ValueError:
            pass
        else:
            full_name = req_body.get('full_name')

    if full_name:
        return func.HttpResponse(f"Hello, {full_name}. Welcome to group 2 Knixat Cloud DevOps.")
    else:
        return func.HttpResponse(
            "This HTTP triggered function executed successfully. Pass a name in the query string or in the request body for a personalized response.",
            status_code=200
        )
