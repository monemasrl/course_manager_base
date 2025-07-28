FROM odoo:16.0-20250725
USER root
RUN pip3 install python-codicefiscale==0.8.0 vatnumber cachetools cerberus jwt \
    email-validator parse-accept-language pyquerystring cssselect && \
    pip3 install apispec pydantic==2.7.1 icalendar && \
    pip3 install openpyxl borb==2.1.11 && \
    pip3 install pandas

USER odoo

COPY ./addons /mnt/extra-addons