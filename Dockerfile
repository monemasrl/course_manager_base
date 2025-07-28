FROM bitnami/git:2.50.1-debian-12-r1 AS base
RUN mkdir -p /mnt/addons
RUN git clone git@github.com:monemasrl/course_manager_base.git /mnt/addons && \
    cd /mnt/addons && \
    git submodule update --init --recursive

FROM odoo:16.0
USER root
RUN pip3 install python-codicefiscale==0.8.0 vatnumber cachetools cerberus jwt \
    email-validator parse-accept-language pyquerystring cssselect && \
    pip3 install apispec pydantic==2.7.1 icalendar && \
    pip3 install openpyxl borb==2.1.11 && \
    pip3 install pandas

USER odoo

COPY --from=base /mnt/addons /mnt/extra-addons