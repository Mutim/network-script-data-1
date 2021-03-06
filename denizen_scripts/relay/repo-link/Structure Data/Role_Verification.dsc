Role_Verification:
    type: task
    debug: false
    definitions: Author|Group
    script:
        - foreach <queue.script.data_key[PermissionRoles]> as:Role:
            - foreach <list[Public|Staff]> as:Guild:
                - foreach <script[DDTBCTY].list_keys[<[Guild]>.Roles]> as:ID:
                    - announce "<[Role]> <[Guild]> <[ID]>"
                    - if <script[DDTBCTY].data_key[<[Guild]>.Roles.<[ID]>]> == <[Role]>:
                        - define PermissionIDs:->:<[ID]>
        - if !<[PermissionIDs].contains_any[<[Author].roles[<[Group]>].parse[ID]>]>:
            - stop
